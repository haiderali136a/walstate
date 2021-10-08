GENDERS = (
    ('-', 'Choose...'),
    ('male', 'Male'),
    ('female', 'Female'),
    ('other', 'Other')
)

TRANSFER_BALANCE_CHOICES = (
    ('-', 'Choose...'),
    ('team_earning', 'Team Earning'),
    ('salary', 'Salary')
)

DOCUMENT_APPROVAL_CHOICES = (
    ('-', 'Choose...'),
    ('pending', 'Pending'),
    ('verified', 'Verified'),
    ('not_verified', 'Not Verified')
)


class Node(object):
    def __init__(self, data):
        self.data = data
        self.children = []
        self.count = 0

    def add_child(self, obj):
        self.children.append(obj)
