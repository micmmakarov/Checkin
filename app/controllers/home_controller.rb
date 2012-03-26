class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  end

  def signin

    if current_user
      @Record = Record.find(:last, :order => 'created_at DESC', :conditions => ["user_id = ?",  current_user.id])
      #@records = Record.find(current_user.id, :order => 'created_at DESC')
      #@record= @Records[0]

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: [:me => current_user,  :last_record => @Record] }
      end

    else
      render :text => 'Not OK!'
    end



  end

end
