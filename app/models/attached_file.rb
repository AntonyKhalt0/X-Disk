class AttachedFile < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  validates :file,
    attached: true,
    content_type: { in: [ "application/zip",
                         "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                         "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] },
    size: { less_than_or_equal_to: 4.megabytes, message: "is too large!" }

  validate :check_available_memory

  def check_available_memory
    user.available_memory > file.byte_size
  end

  def is_zip?
    file.content_type.split('/').last == "zip"
  end

  def is_docx?
    file.content_type.split('/').last.split('.').last == "document"
  end

  def is_xlsx?
    file.content_type.split('/').last.split('.').last == "sheet"
  end
end
