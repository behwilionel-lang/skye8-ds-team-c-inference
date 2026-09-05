## EXP-001
Do not ship. Effect +0.90 pts, range crosses zero (-1.16 to 2.96),
power only 15% so we barely had a chance to catch anything. Found the
real segment reversal here though, Ghana dropped 11.83 pts while
Cameroon gained 4.04 pts. The overall average hides this completely.
Would hurt Ghana if shipped as is.

## EXP-002
Do not ship once you correct for testing 8 experiments at once (was
significant before that correction). Effect +2.47 pts, range 0.46 to
4.48, power 16%. CUPED 0% again. When I broke it down by device,
android and ios were both clearly positive but web came out negative
(0.96%), not quite proven on its own but 9,884 users so not nothing.
Checked it day by day too, positive 19 of 21 days, no weird spike.

## EXP-003
Do not ship. Effect +0.96 pts, range crosses zero (-0.88 to 2.79),
power only 24%. CUPED 0%. No reversal in any group. Revenue is skewed
here so tried a bootstrap method instead of a plain average, still
nothing.

## EXP-004
Ship this one, it's the real deal. Effect +3.71 pts, range 1.59 to
5.84, still holds after the strict correction. Power was only 10% but
the effect was big enough to show up anyway. Every group positive,
strongest in Nigeria.

## EXP-006
Do not ship. Effect +1.28 pts, crosses zero, power 23%. CUPED 0%.
Nothing weird in any group.

## EXP-007
Do not ship. Effect +1.04 pts, crosses zero, power 15%. Also not
stable over time, effect went from -3.73 to +1.04 pts depending on the
day, so even the direction wasn't consistent.

## EXP-008
Do not ship. Effect +0.37 pts, crosses zero, power only 10%. Saw some
group difference (Chad negative, Ghana positive) but not as clean as
the EXP-001 one so not calling this a confirmed reversal.

## EXP-009
Do not ship. Effect basically 0, power 16%. Nothing here at all.

## Team note
CUPED didn't help any of the 8 experiments. Pre period revenue barely
matches during test revenue anywhere, never above 0.01 correlation. So
past spending doesn't predict spending during the test. Worth telling
the head of product, either the 28 day window is wrong or revenue is
just too random per person for this to work here.



#  Statistical Review

- Overall inference: Most experiments were underpowered for detecting a 2% relative lift. Therefore, non-significant results should be described as "insufficient evidence", not proof of no effect.
- Multiplicity: After Bonferroni correction for 8 experiments (α = 0.00625), EXP-004 remains significan, while EXP-002 no longer does.
- Segment reversal: EXP-001 had an overall +0.90 pp effect, but Ghana fell by 11.83 pp while Cameroon increased by 4.04 pp. Averages can therefore hide serious subgroup harm.
- Unstable effect: EXP-007 ranged from −3.73 pp to +1.04 pp during the experiment, so its final positive estimate should not be treated as a stable effect.
- Revenue: EXP-003 and EXP-009 had extreme revenue skew. Bootstrap intervals included zero, providing no convincing evidence of a reliable revenue increase.
- Bayesian evidence: EXP-002 and EXP-004 showed high posterior probability of treatment being better than control, but multiplicity and experimental design still matter for the final decision.
- Sequential testing: EXP-002 repeatedly crossed the 0.05 threshold during the experiment, highlighting the need for predefined stopping rules.

- Statistical conclusion: EXP-004 provides the strongest evidence for rollout. The remaining experiments should not be treated as confirmed wins without stronger evidence.
Power was under 25% for every single experiment. So most of these do
not ship calls just mean we didn't have enough people to know, not that
we proved anything doesn't work. Need way bigger sample sizes going
forward. CUPED also didn't help anywhere, checked all 8 and pre period
revenue never correlated with revenue during the test.
