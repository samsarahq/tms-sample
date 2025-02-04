require "application_system_test_case"

class FormSubmissionsTest < ApplicationSystemTestCase
  setup do
    @form_submission = form_submissions(:one)
  end

  test "visiting the index" do
    visit form_submissions_url
    assert_selector "h1", text: "Form submissions"
  end

  test "should create form submission" do
    visit form_submissions_url
    click_on "New form submission"

    fill_in "Assigned to", with: @form_submission.assigned_to_id
    fill_in "Form template", with: @form_submission.form_template_id
    fill_in "Samsara", with: @form_submission.samsara_id
    fill_in "Status", with: @form_submission.status
    fill_in "Stop", with: @form_submission.stop_id
    fill_in "Submitted by", with: @form_submission.submitted_by_id
    fill_in "User", with: @form_submission.user_id
    click_on "Create Form submission"

    assert_text "Form submission was successfully created"
    click_on "Back"
  end

  test "should update Form submission" do
    visit form_submission_url(@form_submission)
    click_on "Edit this form submission", match: :first

    fill_in "Assigned to", with: @form_submission.assigned_to_id
    fill_in "Form template", with: @form_submission.form_template_id
    fill_in "Samsara", with: @form_submission.samsara_id
    fill_in "Status", with: @form_submission.status
    fill_in "Stop", with: @form_submission.stop_id
    fill_in "Submitted by", with: @form_submission.submitted_by_id
    fill_in "User", with: @form_submission.user_id
    click_on "Update Form submission"

    assert_text "Form submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Form submission" do
    visit form_submission_url(@form_submission)
    click_on "Destroy this form submission", match: :first

    assert_text "Form submission was successfully destroyed"
  end
end
