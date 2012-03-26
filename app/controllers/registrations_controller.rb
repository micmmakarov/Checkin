class RegistrationsController < Devise::RegistrationsController
  # To change this template use File | Settings | File Templates.


  def new
    @company_id = params[:company_id] if params[:company_id] 
    @Company = Company.find(@company_id);

    super
    if params[:company_id]
      resource.company_id = params[:company_id]
      @company_id = params[:company_id]
    end
  end

  def create
    super
    # add custom create logic here
  end

  def update
    super
    if params[resource_name][:company_id]
      resource.company_id = params[resource_name][:company_id]
    end
  end


end