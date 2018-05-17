class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
    @dose.save

    redirect_to cocktail_path(@cocktail)
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:description)
  end
end
