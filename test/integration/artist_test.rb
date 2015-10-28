require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  def setup
    # @artist = users(:artist)
  end

  test 'artists can login' do
    visit '/users/sign_in'
    assert page.has_content?('Email'), 'not on user login page'
    fill_in('Email', with: 'admin@gmail.com')
    fill_in('Password', with: 'password1234')
    find_button('Log in')
    click_on 'Log in'
    assert page.has_content?('Logout'), 'not logged in'
  end

  test 'artist can create a new events' do
    login_as(users(:two))
    visit new_event_path
    assert page.has_content?('Title'), 'not seeing new event form'
    fill_in('Title', with: 'Clean 3 bedroom house')
    fill_in('Location', with: '1234 Main st')
    fill_in('Start time', with: '10/01/2015 1:00 PM')
    fill_in('End time', with: '10/17/2015 12:00 AM')
    find_button('Create Event')
    click_on 'Create Event'
    assert page.has_content?('Clean 3 bedroom house'), 'job not created'
  end

  test 'update job as employer' do
    login_as(users(:two))
    visit events_path
    assert page.has_content?('MyString')
    first(:link, "Edit").click
    assert page.has_content?('Title'), 'not on edit page'
    fill_in('Title', with: 'Hello Test')
    click_on('Update Event')
    assert page.has_content?('Hello Test'), 'page not updated'
  end

end

