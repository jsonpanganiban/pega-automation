import os
import smtplib
import re
import robot.api
from robot.libraries.BuiltIn import BuiltIn
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
from exchangelib import Account, Configuration, Credentials, DELEGATE
from exchangelib.folders import Messages
from exchangelib.errors import UnauthorizedError, ErrorFolderNotFound

class EmailUtil(object):

    def __init__(self):
        self.logger = robot.api.logger
        self.builtin = BuiltIn()
        self.account = None

    def send_email(self, sender, subject='', *recipients):
        msg = MIMEMultipart()
        msg['Subject'] = subject
        msg['From'] = sender
        msg['To'] = ", ".join(recipients)
        server = smtplib.SMTP('mta-hub.int.carlsonwagonlit.com', 25)
        server.sendmail(sender, recipients, msg.as_string())
        server.quit()

    def send_email_with_message_text(self, sender, subject='', message_text='test', cc=None, *recipients):
    # def send_email_with_message_text(self, sender, subject='', message_text='test', *recipients):
        message = "From: %s\r\n" % sender \
                + "To: %s\r\n" % ",".join(recipients) \
                + "Cc: %s\r\n" % ",".join([cc]) \
                + "Subject: %s\r\n" % subject \
                + "\r\n" + message_text
        if cc:
            recipients = [recipients] + [cc]
        else:
            recipients = [recipients]
        server = smtplib.SMTP('mta-hub.int.carlsonwagonlit.com', 25)
        # server.set_debuglevel(1)
        server.sendmail(sender, recipients, message)
        server.quit()
        
    def send_email_with_attachment(self, sender, attachment_file, subject='', *recipients):
        msg = MIMEMultipart()
        msg['From'] = sender
        msg['To'] = ", ".join(recipients)
        msg['Subject'] = subject
        part = MIMEBase('application', "plain")
        part.set_payload(open(attachment_file, "rb").read())
        encoders.encode_base64(part)
        filename = os.path.basename(attachment_file)
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % filename)
        msg.attach(part)
        server = smtplib.SMTP('mta-hub.int.carlsonwagonlit.com', 25)
        server.sendmail(sender, recipients, msg.as_string())
        server.quit()
        
    def connect_to_exchange(self, server, email, username, password):
        try:
            cred = Credentials(username=username, password=password)
            config = Configuration(server=server, credentials=cred)
            self.account = Account(primary_smtp_address=email, autodiscover=False, config=config, access_type=DELEGATE)
            return self.account
        except UnauthorizedError:
            self.builtin.fail('Wrong username or password for ' + server )

    def get_recent_emails(self, folder_name, count=10):
        try:
            folder = self.account.root / 'Top of Information Store' / folder_name
            return folder.all().order_by('-datetime_received')[:count]
        except ErrorFolderNotFound:
            self.builtin.fail('No subfolder with name ' + folder_name)
    
    def get_email_text_body_from(self, sender, count=1):
        """
        Prereq: Use "Connect To Exchange" kw before calling this

        Returns values in list if count is more than 1
        """
        mail = self.account.inbox.filter(sender=sender).order_by('-datetime_received')[:count]
        text_body = [v.text_body for v in mail]
        return ''.join(text_body) if count < 2 else text_body
    
    def get_email_subject_from(self, sender, count=1):
        """
        Prereq: Use "Connect To Exchange" kw before calling this

        Returns values in list if count is more than 1
        """
        mail = self.account.inbox.filter(sender=sender).order_by('-datetime_received')[:count]
        subject = [v.subject for v in mail]
        return ''.join(subject) if count < 2 else subject
        
    def get_recent_caseid(self, sender):
        """
        Prereq: Use "Connect To Exchange" kw before calling this
        """
        email_subject = self.get_email_subject_from(sender)
        try:
            case_id = re.search(r'.*Request:\s(\w*-\w*)\s.*', email_subject).group(1)
        except Exception:
            case_id = ''
        self.logger.info(case_id)
        return case_id

# if __name__ == "__main__":
#     EmailUtil().send_email('test@ian.com', 'Subject',  'jayson.panganiban@carlsonwagonlit.com')
#     EmailUtil().send_email_with_message_text('test@ian.com', 'test subject', 'message body', 'jayson.panganiban@carlsonwagonlit.com', 'jayson.panganiban@carlsonwagonlit.com')
#     email.send_email('test@ian.com', 'subject', 'message_text', '', 'jayson.panganiban@carlsonwagonlit.com')
#     EmailUtil().send_email_with_attachment('test@ian.com', 'EmailConfig.json', 'attach', 'jayson.panganiban@carlsonwagonlit.com')
