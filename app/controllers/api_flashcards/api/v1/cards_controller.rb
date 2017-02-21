module ApiFlashcards
  module Api
    module V1
      class CardsController < ApiController
        def create
          @card = current_user.cards.build(card_params)
          if @card.save
            render json: { message: 'new card saved' }
          else
            render json: { message: 'failed', errors: @card.errors }, status: :error
          end
        end

        def index
          @cards = current_user.cards
          render json: @cards
        end

        def review
          card = Card.find(params[:card_id])
          translation = params[:translation]
          if card.translated_text == translation
            render json: { message: 'correct' }
          else
            render json: { message: 'incorrect' }, status: :error
          end
        end

        private

        def card_params
          params.require(:card).permit(:original_text, :translated_text)
        end
      end
    end
  end
end
