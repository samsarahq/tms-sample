require "test_helper"

class FormSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_submission = form_submissions(:one)
  end

  test "should get index" do
    get form_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_form_submission_url
    assert_response :success
  end

  test "should create form_submission" do
    assert_difference("FormSubmission.count") do
      post form_submissions_url, params: { form_submission: { assigned_to_id: @form_submission.assigned_to_id, form_template_id: @form_submission.form_template_id, samsara_id: @form_submission.samsara_id, status: @form_submission.status, stop_id: @form_submission.stop_id, submitted_by_id: @form_submission.submitted_by_id, user_id: @form_submission.user_id } }
    end

    assert_redirected_to form_submission_url(FormSubmission.last)
  end

  test "should show form_submission" do
    get form_submission_url(@form_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_submission_url(@form_submission)
    assert_response :success
  end

  test "should update form_submission" do
    patch form_submission_url(@form_submission), params: { form_submission: { assigned_to_id: @form_submission.assigned_to_id, form_template_id: @form_submission.form_template_id, samsara_id: @form_submission.samsara_id, status: @form_submission.status, stop_id: @form_submission.stop_id, submitted_by_id: @form_submission.submitted_by_id, user_id: @form_submission.user_id } }
    assert_redirected_to form_submission_url(@form_submission)
  end

  test "should destroy form_submission" do
    assert_difference("FormSubmission.count", -1) do
      delete form_submission_url(@form_submission)
    end

    assert_redirected_to form_submissions_url
  end
end
