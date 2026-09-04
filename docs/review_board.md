## EXP-001
Effect basically 0 (+0.08 pts), range crosses zero, nothing real here.
CUPED gave 0% pre period revenue doesn't match during test revenue.
Checked every group (device/country/channel), nothing stands out.
Can't tell if it's really no effect or just not enough people, need
power calculation.

## EXP-002
Real effect, +0.94 pts, range 0.42 to 1.46. CUPED 0% again. Android and
ios both clearly positive, web is negative (0.96%), not quite proven on
its own but the only negative result out of 17 group checks, and enough
people in that group (9,884 users) so not just noise. Checked it day by
day too, positive on 19 of 21 days, no weird spike. Trust this result
but someone should check the web group before rolling out.

## EXP-003
+0.40 pts, range barely touches zero (0.02 to 0.81), right on the edge,
not technically proven. CUPED 0%. No reversal in any group. Needs power
calculation.

## EXP-004
Real effect, +1.07 pts, range 0.37 to 1.77. CUPED 0%. Every group
positive or flat, strongest in Nigeria (3.2%, clearly real). Solid win.

## EXP-006
Real effect, +0.52 pts, range 0.09 to 0.95. CUPED 0%. Every group
positive or flat. Another solid win.

## EXP-007
Not proven, +0.25 pts, range crosses zero. CUPED 0%. Didn't check
groups closely since overall result already null. Needs power
calculation.

## EXP-008
Not proven, +0.16 pts, range crosses zero. CUPED 0%. Needs power
calculation.

## EXP-009
Smallest effect, slightly negative (0.02 pts), not proven either way.
CUPED 0%. Needs power calculation.

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
