class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

      if @contact.deliver

        @contact = Contact.new
        redirect_to contact_path
  	    flash[:success] = "Thank you for your message. I'll get back to you soon!"

      else
        redirect_to contact_path
        flash[:danger] = "Message did not send! Check if valid email is entered"
      end

  end

  def contact
     @contact = Contact.new(params[:contact])
  end

end
