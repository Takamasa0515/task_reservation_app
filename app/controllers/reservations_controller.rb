class ReservationsController < ApplicationController
	#protect_from_forgery :except => [:confirm]

	def index
		@user = current_user.id
		@reservation = Reservation.new
		@reservations = Reservation.where(user_id: @user)

	end

	def  confirm
		@reservation = current_user.reservations.new(params.require(:reservation).permit(:start_date, :end_date, :person_num, :room_id))
		@price = params[:reservation][:price]
		@room_name = params[:reservation][:room_name]
		if @reservation.valid?
			@start_date = @reservation.start_date.to_datetime
			@end_date = @reservation.end_date.to_datetime
			@visit_duration = (@end_date - @start_date).to_i
			@total_amount =@price.to_i * @visit_duration * @reservation.person_num.to_i
		else
			flash[:error_start_date] = @reservation.errors.full_messages_for(:start_date)
			flash[:error_end_date] = @reservation.errors.full_messages_for(:end_date)
			flash[:error_person_num] = @reservation.errors.full_messages_for(:person_num)
			redirect_back fallback_location: root_path

		end
	end

	def create
		@reservation = current_user.reservations.create!(reservation_params)
		@room_name = params[:reservation][:room_name]
		flash[:notice] = "予約が正常に完了しました"
		render :show
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def edit_confirm
		@reservation = Reservation.find(params[:id])
		@reservation.attributes = params.require(:reservation).permit(:start_date, :end_date, :person_num)
		if @reservation.valid?
			@start_date = @reservation.start_date.to_datetime
			@end_date = @reservation.end_date.to_datetime
			@visit_duration = (@end_date - @start_date).to_i
			@total_amount =@reservation.room.room_price.to_i * @visit_duration * @reservation.person_num.to_i
		else
			flash[:error_start_date] = @reservation.errors.full_messages_for(:start_date)
			flash[:error_end_date] = @reservation.errors.full_messages_for(:end_date)
			flash[:error_person_num] = @reservation.errors.full_messages_for(:person_num)
			redirect_back fallback_location: root_path
		end
	end

	def update
		@reservation = Reservation.find(params[:id])
		@reservation.update!(reservation_params)
		flash[:reservation_edit_success] = "施設の予約情報を更新しました"
		redirect_to action: :index
	end

	def destroy
		
	end

	private

	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :person_num, :total_amount, :room_id)
	end


end

