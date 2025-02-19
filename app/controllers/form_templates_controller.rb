class FormTemplatesController < ApplicationController
  before_action :set_form_template, only: [:show, :edit, :update, :destroy]

  def index
    @form_templates = current_user.form_templates.order(created_at: :desc)
  end

  def show
  end

  def new
    @form_template = current_user.form_templates.new
  end

  def edit
  end

  def create
    @form_template = current_user.form_templates.new(form_template_params)

    if @form_template.save
      redirect_to form_templates_path, notice: "Form template was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @form_template.update(form_template_params)
      redirect_to form_templates_path, notice: "Form template was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @form_template.destroy
    redirect_to form_templates_path, notice: "Form template was successfully deleted.", status: :see_other
  end

  private

  def set_form_template
    @form_template = current_user.form_templates.find(params[:id])
  end

  def form_template_params
    params.require(:form_template).permit(:title, :slug, :samsara_id, :samsara_revision_id).tap do |whitelisted|
      if params[:form_template][:template_json].present?
        begin
          whitelisted[:template_json] = JSON.parse(params[:form_template][:template_json])
        rescue JSON::ParserError => e
          @form_template&.errors&.add(:template_json, "is not valid JSON: #{e.message}")
        end
      end
    end
  end
end