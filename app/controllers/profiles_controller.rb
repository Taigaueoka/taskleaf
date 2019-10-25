class ProfilesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def edit
    if params[:icon]
      @profile.icon_name = "#{@profile.id}.png"
      icon = params[:icon]
      File.binwrite("default_icon.png#{@profile.icon_name}", icon.read)
    end
  end

  def create
    icon_name:"default_icon.png"
    @profile = current_user.profiles.new(profile_params)


    if params[:back].present?
      render :new
      return
    end

    if @profile.save
      TaskMailer.creation_email(@profile).deliver_now
      redirect_to @profile, notice: "プロフィール「#{@profile.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @profile.update!(profile_params)
    redirect_to profiles_url, notice: "タスク「#{@profile.name}」を更新しました。"
  end

  def confirm_new
    @profile = current_user.profiles.new(profile_params)
    render :new unless @profile.valid?
  end
  private

  def profile_params
    params.require(:profile).permit(:icon)
  end

end
