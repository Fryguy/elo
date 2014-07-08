module PlayersHelper
  def rank_header
    rank_text("Singles", "Doubles")
  end

  def player_rank_text(player)
    rank_text(player.rank, player.doubles_rank)
  end

  private

  def rank_text(singles_text, doubles_text)
    [
      Settings.ignore_singles ? nil : singles_text,
      Settings.ignore_doubles ? nil : doubles_text
    ].compact.join(" / ")
  end
end
