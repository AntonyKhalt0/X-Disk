class AttachedFilesController < ApplicationController
  before_action :authenticate_user!

  def create
    @file = current_user.attached_files.build(files_params)
    @file.name = files_params[:file].original_filename.split('.').first
    if @file.save
      current_user.available_memory -= @file.file.byte_size
      current_user.save(validate: false)
    end

    redirect_to root_path
  end

  def destroy
    @file = AttachedFile.find(params[:id])
    current_user.available_memory += @file.file.byte_size
    current_user.save(validate: false)
    @file.file.purge
    @file.destroy

    redirect_to root_path
  end

  private

  def files_params
    params.require(:attached_file).permit(:file)
  end
end
