require 'test_helper'

class EmployersTest < ActionDispatch::IntegrationTest
  # self.use_transactional_fixtures = false

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
end
