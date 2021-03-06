class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :update, :destroy]

  # Technically, I don't need the action "New" because my edit view = new view
  def new
    @profile = Profile.new
    if current_user.profile != nil?
        redirect_to profile_edit_path
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile

    if @profile.save
        flash[:notice] = 'Profile created!'
        redirect_to profile_show_path
    else
        flash[:alert] = 'Profile could not be created!'
        redirect_back
    end
  end

  def show
    rescue ActiveRecord::RecordNotFound
        redirect_to sign_up_profile_path
  end

  def index
    @profiles = Profile.all
    authorize @profiles
  end

  def edit
    @profile = Profile.find_or_initialize_by(user: current_user)
  end

  def update
    if @profile.update(profile_params)
        flash[:notice] = 'Profile updated!'
        redirect_to profile_show_path
    else
        flash[:alert] = 'Profile could not be updated!'
        redirect_back
    end
  end

  def destroy
    @profile.destroy
  end

  private
    def set_profile
        @profile = current_user.profile
        @reviews = Review.find_by(reviewed_id: current_user)
    end

    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :date_of_birth, :mobile_phone, :about_me, :language_1, :language_2, :language_3, :profile_image, :addr_unit_number, :addr_street_number, :addr_street_name, :addr_city, :addr_state, :addr_postcode, :addr_country_code, :passport_number, :passport_expiry_date, :passport_country_code, :passport_image, :drivers_license_number, :drivers_license_expiry_date, :drivers_license_country_code, :drivers_license_image)
    end
end