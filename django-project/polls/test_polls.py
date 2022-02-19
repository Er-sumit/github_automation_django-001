import pytest
from pytest_django.asserts import assertTemplateUsed
from django.urls import reverse


def capital_case(x):
    return x.capitalize()

def test_capital_case():
    assert capital_case('semaphore') == 'Semaphore'

def test_pytest_sum():
    sum = 1+1
    assert sum == 2

'''
@pytest.mark.urls('mysite.urls')
def test_something(client):
    assert 'Success!' in client.get('/polls/').content
'''

def test_goodbye_view(client):
    url=reverse("luck_result")
    response = client.get(url)
    assert response.status_code == 200
