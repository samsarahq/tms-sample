module Samsara
  class FormSubmissionService
    def initialize(user)
      @user = user
      @client = Samsara::Client.new(user)
    end

    def update_proof_of_delivery(form_submission)
      samsara_form_submission = @client.fetch_form_submission(form_submission.samsara_id)

      form_submission.update!(
        status: samsara_form_submission["status"],
        submitted_by: Driver.find_by(samsara_id: samsara_form_submission["submittedBy"]["id"]),
        submission_json: samsara_form_submission,
      )
    end

    def create_proof_of_delivery(order, stop)
      template = @user.form_templates.find_by(slug: :proof_of_delivery)
      driver = stop.route.driver

      payload = template.template_json
      payload["assignedTo"] = {
        id: driver.samsara_id,
        type: "driver",
      }
      payload["fields"][0]["textValue"]["value"] = "test"
      payload["fields"][1]["tableValue"]["rows"][0]["cells"][0]["textValue"]["value"] = order.id.to_s
      payload["title"] = template.title

      samsara_form_submission = @client.create_form_submission(body: payload)
      FormSubmission.create!(
        user: @user,
        form_template: template,
        assigned_to: driver,
        stop: stop,
        samsara_id: samsara_form_submission["id"],
        submission_json: samsara_form_submission,
      )
    end
  end
end
