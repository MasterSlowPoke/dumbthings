class TodoItemValidator < ActiveModel::Validator
  def validate(record)
    unless record.due.is_a? Date
      record.errors[:base] << "The due date is invalid."
    end
    unless record.assigned.is_a? Date
    	record.errors[:base] << "The assigned date is invalid."
    end
    unless record.completed == !!record.completed
    	record.errors[:base] << "It needs to be completed or not completed."
    end
    unless record.color && record.color.length == 7
      record.color = '#696969';
    end
  end
end

class TodoItem < ActiveRecord::Base
	validates :due, presence: true
	validates :description, presence: true
	validates :owner, presence: true
	# validates :color, length: { is: 7 } # handled with TodoItemValidator now
	validates_with TodoItemValidator
end
