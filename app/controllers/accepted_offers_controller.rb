class AcceptedOffersController < ApplicationController
  def index
    matching_accepted_offers = AcceptedOffer.all

    @list_of_accepted_offers = matching_accepted_offers.order({ :created_at => :desc })

    render({ :template => "accepted_offers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_accepted_offers = AcceptedOffer.where({ :id => the_id })

    @the_accepted_offer = matching_accepted_offers.at(0)

    render({ :template => "accepted_offers/show.html.erb" })
  end

  def create
    the_accepted_offer = AcceptedOffer.new
    the_accepted_offer.offer_id = params.fetch("query_offer_id")
    the_accepted_offer.company_id = params.fetch("query_company_id")
    the_accepted_offer.offer_start = params.fetch("query_offer_start")
    the_accepted_offer.offer_end = params.fetch("query_offer_end")
    the_accepted_offer.number_of_redeems = params.fetch("query_number_of_redeems")

    if the_accepted_offer.valid?
      the_accepted_offer.save
      redirect_to("/accepted_offers", { :notice => "Accepted offer created successfully." })
    else
      redirect_to("/accepted_offers", { :alert => the_accepted_offer.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_accepted_offer = AcceptedOffer.where({ :id => the_id }).at(0)

    the_accepted_offer.offer_id = params.fetch("query_offer_id")
    the_accepted_offer.company_id = params.fetch("query_company_id")
    the_accepted_offer.offer_start = params.fetch("query_offer_start")
    the_accepted_offer.offer_end = params.fetch("query_offer_end")
    the_accepted_offer.number_of_redeems = params.fetch("query_number_of_redeems")

    if the_accepted_offer.valid?
      the_accepted_offer.save
      redirect_to("/accepted_offers/#{the_accepted_offer.id}", { :notice => "Accepted offer updated successfully."} )
    else
      redirect_to("/accepted_offers/#{the_accepted_offer.id}", { :alert => the_accepted_offer.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_accepted_offer = AcceptedOffer.where({ :id => the_id }).at(0)

    the_accepted_offer.destroy

    redirect_to("/accepted_offers", { :notice => "Accepted offer deleted successfully."} )
  end
end
