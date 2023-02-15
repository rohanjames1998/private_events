class InvitationsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]

  def create

    event_id = params[:invitation][:attended_event_id]
    user = User.find(params[:invitation][:attendee_id])
    @invitation = user.invitations.build(invitation_params)

    if @invitation.save
     flash[:notice] = "Invitation Sent!"
     redirect_to event_path(event_id)
    else
      flash[:alert] = "Already Invited!"
      redirect_to event_path(event_id)
    end
  end

  def destroy
    invitation = Invitation.find_by(attendee_id: current_user.id, attended_event_id: params[:invitation][:attended_event_id])
    event = Event.find(params[:invitation][:attended_event_id])
    invitation.destroy
    redirect_to event_path(event)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :attended_event_id)
  end

end
