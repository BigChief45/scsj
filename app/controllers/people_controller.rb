class PeopleController < ApplicationController

  before_action :authenticate_user!
  before_action :set_person, except: [:index, :new, :search]

  def search
    @people = Person.all.where('name LIKE ? OR last_name LIKE ?',
      "%#{params[:q]}%", "%#{params[:q]}%")

    respond_to do |format|
      format.json { render json: @people.map { |p| { id: p.id, full_name: p.full_name } } }
    end
  end

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.create
        format.js
      else
        format.js { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, flash: { success: 'Persona editada exitosamente' } }
      else
        format.html { render 'edit', flash: { danger: 'Error al tratar de actualizar persona.' } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @person.destroy
        format.html { redirect_to people_path, flash: { success: 'Persona eliminada exitosamente del sistema.' } }
      end
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :last_name, :id_number, :birthdate)
  end

end
