class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => :failure)
    return sign_in_and_redirect(resource_name, resource) if params['aaa']!=""
    redirect_to :controller => "home", :action => 'index'
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    @Record = Record.find(:last, :order => 'created_at DESC', :conditions => ["user_id = ?",  current_user.id])
    respond_to do |format|
      format.json {render :json => {:success => true, :user => current_user, :last_record => @Record}} #:redirect => stored_location_for(scope) || after_sign_in_path_for(resource)
      format.html  { redirect_to :controller => "home", :action => 'index' }
    end
  end


  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end
end