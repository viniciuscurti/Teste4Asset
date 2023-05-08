class PersonsController < ApplicationController
  skip_verify_authenticity_token

  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def newß
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    render json: 'Person was successfully destroyed.'
  end
end
