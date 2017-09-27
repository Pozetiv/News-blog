class ContactsController < ApplicationController

  def new
    @massage = Contact.new
  end

  def create
    @massage = Contact.new(contact_params)
    if @massage.save
      redirect_to @massage
    end

  end

  def show
    @massage = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permite(:title, :body, :email, :other)
  end

end
