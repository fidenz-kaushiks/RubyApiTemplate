class V1::HorsesController < ApiController
  before_action :authenticate_user!
  before_action :get_horse, only: [:show, :update]

  def index
    horses = current_user.horses
    render json: {
      status: 'success',
      data: horses
    }, status: (horses.blank? ? :no_content : :ok)
  end

  def create
    horse  = Horse.new(horse_params)
    horse.user = current_user
    if horse.valid?
      if horse.save!
        render json: {
          status: 'success',
          data: horse,
        }, status: :ok
        return
      end
    end
    render json: {
      status: 'error',
      data: horse,
      errors: error_tag(horse),
    }, status: current_user.is_forbidden? ? :forbidden : :unprocessable_entity
  end

  def show
    render json: {
      status: 'success',
      data: @horse
    }, status: :ok
  end

  def update
    @horse.update(horse_params)
    if @horse.valid?
      if @horse.save!
        render json: {
          status: 'success',
          data: @horse,
        }, status: :ok
        return
      end
    end
    render json: {
      status: 'error',
      data: @horse,
      errors: error_tag(@horse),
    }, status: :unprocessable_entity
  end

  private

  def horse_params
    params.permit(:barn, :name, :gender, :note, :color)
  end

  def get_horse
    id      = params[:id]
    @horse  = Horse.find_by(id: id)

    unless @horse.persisted? && is_owner?
      render json: {
        status: 'error',
        data: nil
      }, status: :not_found
      return
    end
  end

  def is_owner?
    @horse.user == current_user
  end
end
