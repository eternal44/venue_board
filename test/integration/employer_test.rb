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
    select('2015', :from => 'job_start_1i')
    select('October', :from => 'job_start_2i')
    select('15', :from => 'job_start_3i')
    select('03', :from => 'job_start_4i')
    select('30', :from => 'job_start_5i')
    select('Created', :from => 'job_status')
    find_button('Create Job')
    click_on 'Create Job'
    assert page.has_content?('Clean 3 bedroom house'), 'job not created'
  end
end
