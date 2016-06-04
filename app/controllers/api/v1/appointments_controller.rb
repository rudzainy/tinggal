class Api::V1::AppointmentsController < Api::V1::ApplicationController

  # http://tinggal.herokuapp.com/api/v1/create_appointment?user_id=1&agent_id=12345&listing_id=7&date=31/12/2016

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: { success: 'true', message: 'Successfully created appointment', status: 200 }
    else
      render json: { success: 'false', message: 'Error! ' + appointment.errors.full_messages.to_s, status: 422 }
    end
  end

  # http://tinggal.herokuapp.com/api/v1/all_appointments?email=rudzainy@rudzainy.com

  def show
    if params[:email]
      appointments = User.find_by_email(params[:email]).appointments
      render json: { success: 'true', appointments: appointments, status: 200 }
    else
      render json: { success: 'false', message: 'Error! ' + appointments.errors.full_messages.to_s, status: 400 }
    end
  end

  private

  def appointment_params
    params.permit(:user_id, :agent_id, :listing_id, :date)
  end
end