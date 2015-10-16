require 'test_helper'

class EmployersTest < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  def setup
    @employer = employers(:one)
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
    fill_in('Start', with: 'Feb 4, 2015') # match date picker / selection
    fill_in('End', with: 'Feb 5, 2015') # match date picker / selection
    fill_in('Status', with: 'Looking') # match date picker / selection
  end
end
