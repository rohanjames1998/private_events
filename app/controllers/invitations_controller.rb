class InvitationsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]

  def create

    user = User.find(user_id)
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
    invitation = Invitation.find_by(attendee_id: user_id, attended_event_id: event_id)
    invitation.destroy
    redirect_to event_path(event_id)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :attended_event_id)
  end

  def user_id
    params[:invitation][:attendee_id]
  end

  def event_id
    params[:invitation][:attended_event_id]
  end

end
