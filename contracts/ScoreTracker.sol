// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.22 <=0.8.17;

abstract contract Game {
    string homeTeam;
    string awayTeam;

    constructor(string memory _homeTeam, string memory _awayTeam) {
        homeTeam = _homeTeam;
        awayTeam = _awayTeam;
    }

    function getHomeTeamScore() internal view virtual returns (uint256);

    function getAwayTeamScore() internal view virtual returns (uint256);

    function getWinningTeam() public view returns (string memory) {
        if (getHomeTeamScore() > getAwayTeamScore()) {
            return homeTeam;
        } else {
            return awayTeam;
        }
    }
}

contract BasketballGame is Game {
    uint256 homeTeamScore;
    uint256 awayTeamScore;

    constructor(string memory _homeTeam, string memory _awayTeam)
        Game(_homeTeam, _awayTeam)
    {}

    modifier validScore(uint256 score) {
        require(score > 0 && score < 4, "invalid score");
        _;
    }

    function getHomeTeamScore() internal view override returns (uint256) {
        return homeTeamScore;
    }

    function getAwayTeamScore() internal view override returns (uint256) {
        return awayTeamScore;
    }

    function homeTeamScored(uint256 score) external validScore(score) {
        homeTeamScore += score;
    }

    function awayTeamScored(uint256 score) external validScore(score) {
        awayTeamScore += score;
    }
}

contract SoccerGame is Game {
    uint256 homeTeamScore;
    uint256 awayTeamScore;

    constructor(string memory _homeTeam, string memory _awayTeam)
        Game(_homeTeam, _awayTeam)
    {}

    function getHomeTeamScore() internal view override returns (uint256) {
        return homeTeamScore;
    }

    function getAwayTeamScore() internal view override returns (uint256) {
        return awayTeamScore;
    }

    function homeTeamScored() external {
        homeTeamScore++;
    }

    function awayTeamScored() external {
        awayTeamScore++;
    }
}
