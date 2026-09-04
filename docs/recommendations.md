## pre period data isnt useful right now
checked if CUPED (using what a user spent in the 28 days before a test)
could sharpen our results. didnt help in any of the 8 experiments,
correlation between pre period and during test revenue never went above
0.01. either the 28 day window is wrong or revenue is just too random
per person for this to work. worth checking before relying on it for
future experiments.


# Statistical Recommendations

* Decisions to reconsider

- EXP-002 should not be treated as a confirmed win. Although it was significant before correction, it did not remain significant after the Bonferroni correction across the eight analysable experiments.
- Non-significant experiments should not automatically be treated as failures. The realised power to detect a 2% relative lift was low, so most non-significant results provide insufficient evidence rather than evidence of no effect.
- EXP-001 should not be rolled out universally without further investigation. Its overall positive effect hides a substantial negative effect for users in Ghana.

* Changes to the experimentation process

1. Plan sample size before launching experiments so there is adequate power to detect a 2% relative lift.
2. Report effect sizes with confidence intervals and power, rather than relying on p-values alone.
3. Apply multiple-comparison correction when several experiments or hypotheses are evaluated together.
4. Use predefined stopping rules instead of repeatedly checking p-values and stopping when a result first becomes significant.
5. Check important user segments before rollout so harmful subgroup effects are not hidden by the overall average.
6. Use robust methods for highly skewed revenue, such as bootstrap inference, when extreme values make a simple mean-based test unreliable.
7. Validate variance-reduction covariates before relying on them. In these experiments, pre-period revenue did not provide useful predictive information for CUPED.

* Minimum sample size for a 2% relative lift

Using a two-sided significance level of 0.05, 80% target power and equal allocation between control and treatment, the required sample size depends on the baseline conversion rate. Across the eight analysable experiments, the calculation gives approximately 27,081–69,443 users per group (about 54,161–138,885 users total).

Therefore, future experiments should be planned using the expected baseline conversion rate rather than a fixed sample size. The sample should be large enough to detect the required 2% relative lift with adequate power.

Overall recommendation: Experiment decisions should consider effect size, confidence intervals, statistical power, multiplicity, subgroup behaviour and practical importance rather than treating a p-value below 0.05 as sufficient evidence to ship.
