-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Teams] (
    [ID] int  NOT NULL ,
    [Name] TEXT  NOT NULL ,
    [City] Text  NOT NULL ,
    CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Players] (
    [ID] int  NOT NULL ,
    [Name] TEXT  NOT NULL ,
    [Birtday] DATE  NOT NULL ,
    [Height] int  NOT NULL ,
    [current_team_id] int  NOT NULL ,
    CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Goals] (
    [ID] int  NOT NULL ,
    [Player_id] int  NOT NULL ,
    [Match_id] int  NOT NULL ,
    CONSTRAINT [PK_Goals] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Matches] (
    [ID] int  NOT NULL ,
    [Home_team_id] int  NOT NULL ,
    [Away_team_id] int  NOT NULL ,
    [Location] TEXT  NOT NULL ,
    [Date] DATE  NOT NULL ,
    [Start_time] TIME  NOT NULL ,
    [Season_id] int  NOT NULL ,
    [Head_referee_id] int  NOT NULL ,
    [Assistent_referee_1_id] int  NOT NULL ,
    [Assistent_referee_2_id] int  NOT NULL ,
    CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Results] (
    [ID] int  NOT NULL ,
    [Team_id] int  NOT NULL ,
    [Match_id] int  NOT NULL ,
    [Result] (win,loss,draw)  NOT NULL ,
    CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Referees] (
    [ID] int  NOT NULL ,
    [Name] TEXT  NOT NULL ,
    CONSTRAINT [PK_Referees] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Lineups] (
    [ID] int  NOT NULL ,
    [Player_id] int  NOT NULL ,
    [Match_id] int  NOT NULL ,
    [Team_id] int  NOT NULL ,
    CONSTRAINT [PK_Lineups] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

CREATE TABLE [Season] (
    [ID] int  NOT NULL ,
    [Start_date] DATE  NOT NULL ,
    [End_date] DATE  NOT NULL ,
    CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

ALTER TABLE [Players] WITH CHECK ADD CONSTRAINT [FK_Players_current_team_id] FOREIGN KEY([current_team_id])
REFERENCES [Teams] ([ID])

ALTER TABLE [Players] CHECK CONSTRAINT [FK_Players_current_team_id]

ALTER TABLE [Goals] WITH CHECK ADD CONSTRAINT [FK_Goals_Player_id] FOREIGN KEY([Player_id])
REFERENCES [Players] ([ID])

ALTER TABLE [Goals] CHECK CONSTRAINT [FK_Goals_Player_id]

ALTER TABLE [Goals] WITH CHECK ADD CONSTRAINT [FK_Goals_Match_id] FOREIGN KEY([Match_id])
REFERENCES [Matches] ([ID])

ALTER TABLE [Goals] CHECK CONSTRAINT [FK_Goals_Match_id]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_ID] FOREIGN KEY([ID])
REFERENCES [Results] ([Match_id])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_ID]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_Home_team_id] FOREIGN KEY([Home_team_id])
REFERENCES [Teams] ([ID])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_Home_team_id]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_Away_team_id] FOREIGN KEY([Away_team_id])
REFERENCES [Teams] ([ID])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_Away_team_id]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_Season_id] FOREIGN KEY([Season_id])
REFERENCES [Season] ([ID])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_Season_id]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_Head_referee_id] FOREIGN KEY([Head_referee_id])
REFERENCES [Referees] ([ID])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_Head_referee_id]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_Assistent_referee_1_id] FOREIGN KEY([Assistent_referee_1_id])
REFERENCES [Referees] ([ID])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_Assistent_referee_1_id]

ALTER TABLE [Matches] WITH CHECK ADD CONSTRAINT [FK_Matches_Assistent_referee_2_id] FOREIGN KEY([Assistent_referee_2_id])
REFERENCES [Referees] ([ID])

ALTER TABLE [Matches] CHECK CONSTRAINT [FK_Matches_Assistent_referee_2_id]

ALTER TABLE [Results] WITH CHECK ADD CONSTRAINT [FK_Results_Team_id] FOREIGN KEY([Team_id])
REFERENCES [Teams] ([ID])

ALTER TABLE [Results] CHECK CONSTRAINT [FK_Results_Team_id]

ALTER TABLE [Lineups] WITH CHECK ADD CONSTRAINT [FK_Lineups_Player_id] FOREIGN KEY([Player_id])
REFERENCES [Players] ([ID])

ALTER TABLE [Lineups] CHECK CONSTRAINT [FK_Lineups_Player_id]

ALTER TABLE [Lineups] WITH CHECK ADD CONSTRAINT [FK_Lineups_Match_id] FOREIGN KEY([Match_id])
REFERENCES [Matches] ([ID])

ALTER TABLE [Lineups] CHECK CONSTRAINT [FK_Lineups_Match_id]

ALTER TABLE [Lineups] WITH CHECK ADD CONSTRAINT [FK_Lineups_Team_id] FOREIGN KEY([Team_id])
REFERENCES [Teams] ([ID])

ALTER TABLE [Lineups] CHECK CONSTRAINT [FK_Lineups_Team_id]

COMMIT TRANSACTION QUICKDBD