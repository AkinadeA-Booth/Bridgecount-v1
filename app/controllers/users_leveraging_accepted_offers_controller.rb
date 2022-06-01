class UsersLeveragingAcceptedOffersController < ApplicationController
  def index
    matching_users_leveraging_accepted_offers = UsersLeveragingAcceptedOffer.all

    @list_of_users_leveraging_accepted_offers = matching_users_leveraging_accepted_offers.order({ :created_at => :desc })

    render({ :template => "users_leveraging_accepted_offers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users_leveraging_accepted_offers = UsersLeveragingAcceptedOffer.where({ :id => the_id })

    @the_users_leveraging_accepted_offer = matching_users_leveraging_accepted_offers.at(0)

    render({ :template => "users_leveraging_accepted_offers/show.html.erb" })
  end

  def create
    the_users_leveraging_accepted_offer = UsersLeveragingAcceptedOffer.new
    the_users_leveraging_accepted_offer.user_id = params.fetch("query_user_id")
    the_users_leveraging_accepted_offer.accepted_offer_id = params.fetch("query_accepted_offer_id")
    #the_users_leveraging_accepted_offer.number_of_times_redeemed = params.fetch("query_number_of_times_redeemed")

    if the_users_leveraging_accepted_offer.valid?
      the_users_leveraging_accepted_offer.save
      redirect_to("/users_leveraging_accepted_offers", { :notice => "Offer added successfully." })
    else
      redirect_to("/users_leveraging_accepted_offers", { :alert => the_users_leveraging_accepted_offer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_users_leveraging_accepted_offer = UsersLeveragingAcceptedOffer.where({ :id => the_id }).at(0)

    the_users_leveraging_accepted_offer.user_id = params.fetch("query_user_id")
    the_users_leveraging_accepted_offer.accepted_offer_id = params.fetch("query_accepted_offer_id")
    the_users_leveraging_accepted_offer.number_of_times_redeemed = params.fetch("query_number_of_times_redeemed")

    if the_users_leveraging_accepted_offer.valid?
      the_users_leveraging_accepted_offer.save
      redirect_to("/users_leveraging_accepted_offers/#{the_users_leveraging_accepted_offer.id}", { :notice => "Users leveraging accepted offer updated successfully."} )
    else
      redirect_to("/users_leveraging_accepted_offers/#{the_users_leveraging_accepted_offer.id}", { :alert => the_users_leveraging_accepted_offer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_users_leveraging_accepted_offer = UsersLeveragingAcceptedOffer.where({ :id => the_id }).at(0)

    the_users_leveraging_accepted_offer.destroy

    redirect_to("/users_leveraging_accepted_offers", { :notice => "Users leveraging accepted offer deleted successfully."} )
  end
end
