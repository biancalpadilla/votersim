module Election

  def run_election
    vote_count = {}

    politicians.each { |politician| vote_count[politician.name] = 1} # Politicans always vote for themselves, to each politician starts at 1 vote_count

    voters.each { |person| politician = person.vote(@politicians)
      vote_count[politician.name] += 1
    }

    vote_count
  end

    def select_winner
      winner = run_election
      max_quantity = winner.values.max
      winner.select { |k, v| v == max_quantity }.keys.to_a
    end

    def report_winner
      candidate = select_winner.sample
      puts "The winner is #{candidate}!"
    end

end