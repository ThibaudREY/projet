class GenericController < ApplicationController

  protected
    def update(params)
      instance_variable = instance_variable_get("@#{controller_name.singularize}")
      respond_to do |format|
        if instance_variable.update(params)
          format.html { redirect_to instance_variable, notice: controller_name.singularize.titleize + ' was successfully updated.' }
          format.json { render :show, status: :ok, location: instance_variable }
        else
          format.html { render :edit }
          format.json { render json: instance_variable.errors, status: :unprocessable_entity }
        end
      end
    end

  def create
    instance_variable = instance_variable_get("@#{controller_name.singularize}")
    respond_to do |format|
      if instance_variable.save
        format.html { redirect_to instance_variable, notice: controller_name.singularize.titleize + ' was successfully created.' }
        format.json { render :show, status: :created, location: instance_variable }
      else
        format.html { render :new }
        format.json { render json: instance_variable.errors, status: :unprocessable_entity }
      end
    end
  end
end
