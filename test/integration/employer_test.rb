require 'test_helper'

class EmployersTest < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  def setup
    @employer = employers(:one)
    @job = jobs(:one)
  end

  test 'employers can login' do
    visit '/employers/sign_in'
    assert page.has_content?('Email'), 'not on employer login page'
    fill_in('Email', with: 'employer@example.com')
    fill_in('Password', with: 'password1234')
    find_button('Log in')
    click_on 'Log in'
    assert page.has_content?('Logout'), 'not logged in'
  end

  test 'employer can create a new job' do
    login_as(@employer)
    visit new_job_path
    assert page.has_content?('Title')
    fill_in('Title', with: 'Clean 3 bedroom house')
    fill_in('Location', with: '1234 Main st')
    fill_in('Start', with: '10/01/2015 1:00 PM')
    fill_in('End', with: '10/17/2015 12:00 AM')
    find_button('Create Job')
    click_on 'Create Job'
    assert page.has_content?('Clean 3 bedroom house'), 'job not created'
  end

  test 'update job as employer' do
    login_as(@employer)
    visit job_path(@job)
    assert page.has_content?('MyString')
    click_on('Edit')
    fill_in('Title', with: 'Hello Test')
    click_on('Update Job')
    assert page.has_content?('Update Job')
  end
end
