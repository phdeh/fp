
officer_name(janosz).
officer_name(ferenc).
officer_name(bela).
officer_name(lajosz).
officer_name(andrasz).

officer_rank(sub_colonel).
officer_rank(major).
officer_rank(major).
officer_rank(major).
officer_rank(captain).

military_branch(air_forces).
military_branch(sapeur).
military_branch(signal_corps).
military_branch(artillery).
military_branch(trooper).

rel(NAME, RANK, BRANCH) :- officer_name(NAME), officer_rank(RANK), military_branch(BRANCH),
                NAME = janosz,
                RANK = major,
                not(BRANCH = sapeur).

rel(NAME, RANK, BRANCH) :- officer_name(NAME), officer_rank(RANK), military_branch(BRANCH),
                NAME = ferenc,
                not(RANK = captain),
                not(RANK = sub_colonel),
                not(BRANCH = air_forces),
                not(BRANCH = sapeur),
                not(BRANCH = signal_corps),
                not(BRANCH = trooper).

rel(NAME, RANK, BRANCH) :- officer_name(NAME), officer_rank(RANK), military_branch(BRANCH),
                NAME = lajosz,
                RANK = captain,
                not(BRANCH = air_forces),
                not(BRANCH = sapeur),
                not(BRANCH = signal_corps),
                not(BRANCH = artillery).

rel(NAME, RANK, BRANCH) :- officer_name(NAME), officer_rank(RANK), military_branch(BRANCH),
                NAME = bela,
                not(RANK = captain),
                not(RANK = major),
                not(BRANCH = air_forces),
                not(BRANCH = sapeur),
                not(BRANCH = artillery),
                not(BRANCH = trooper).

rel(NAME, RANK, BRANCH) :- officer_name(NAME), officer_rank(RANK), military_branch(BRANCH),
                NAME = andrasz,
                not(RANK = captain),
                not(RANK = sub_colonel),
                not(BRANCH = air_forces),
                not(BRANCH = artillery),
                not(BRANCH = trooper).

result(S1, S2, S3, S4, S5) :-
                NAME1 = janosz, rel(NAME1, RANK1, BRANCH1),
                NAME2 = ferenc, rel(NAME2, RANK2, BRANCH2),
                NAME3 = bela, rel(NAME3, RANK3, BRANCH3),
                NAME4 = lajosz, rel(NAME4, RANK4, BRANCH4),
                NAME5 = andrasz, rel(NAME5, RANK5, BRANCH5),
                S1 = [NAME1, RANK1, BRANCH1],
                S2 = [NAME2, RANK2, BRANCH2],
                S3 = [NAME3, RANK3, BRANCH3],
                S4 = [NAME4, RANK4, BRANCH4],
                S5 = [NAME5, RANK5, BRANCH5].