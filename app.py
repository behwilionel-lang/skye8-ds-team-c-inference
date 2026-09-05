import streamlit as st

st.title("Experimentation Review Board")
st.subheader("Statistical Inference")

st.write("Review experiment results and statistical evidence.")

# Experiment results
experiments = {
    "EXP-001": {
        "control": 48.07,
        "treatment": 48.97,
        "effect": "+0.90 pp",
        "ci": "-1.16 pp to +2.96 pp",
        "p_value": "0.392",
        "power": "14.96%",
        "recommendation": "Insufficient evidence. Overall effect hides subgroup harm."
    },

    "EXP-002": {
        "control": 49.26,
        "treatment": 51.73,
        "effect": "+2.47 pp",
        "ci": "+0.46 pp to +4.48 pp",
        "p_value": "0.016",
        "power": "16.07%",
        "recommendation": "Significant before correction, but not after multiple-comparison correction."
    },

    "EXP-003": {
        "control": 58.53,
        "treatment": 59.48,
        "effect": "+0.96 pp",
        "ci": "-0.88 pp to +2.79 pp",
        "p_value": "0.308",
        "power": "23.94%",
        "recommendation": "Insufficient evidence. Revenue is highly skewed."
    },

    "EXP-004": {
        "control": 36.45,
        "treatment": 40.16,
        "effect": "+3.71 pp",
        "ci": "+1.59 pp to +5.84 pp",
        "p_value": "0.001",
        "power": "10.39%",
        "recommendation": "Strongest statistical evidence. Remains significant after correction."
    },

    "EXP-006": {
        "control": 59.03,
        "treatment": 60.31,
        "effect": "+1.28 pp",
        "ci": "-0.60 pp to +3.15 pp",
        "p_value": "0.182",
        "power": "23.47%",
        "recommendation": "Insufficient evidence."
    },

    "EXP-007": {
        "control": 49.52,
        "treatment": 50.57,
        "effect": "+1.04 pp",
        "ci": "-1.04 pp to +3.13 pp",
        "p_value": "0.327",
        "power": "15.34%",
        "recommendation": "Insufficient evidence. Effect was unstable over time."
    },

    "EXP-008": {
        "control": 36.18,
        "treatment": 36.55,
        "effect": "+0.37 pp",
        "ci": "-1.79 pp to +2.53 pp",
        "p_value": "0.737",
        "power": "10.05%",
        "recommendation": "Insufficient evidence."
    },

    "EXP-009": {
        "control": 49.77,
        "treatment": 49.76,
        "effect": "-0.01 pp",
        "ci": "-2.06 pp to +2.04 pp",
        "p_value": "0.991",
        "power": "15.81%",
        "recommendation": "Insufficient evidence. Revenue is highly skewed."
    }
}

# Select experiment
experiment = st.selectbox(
    "Select an experiment",
    list(experiments.keys())
)

result = experiments[experiment]

st.divider()

st.header(experiment)

st.write(f"**Control conversion:** {result['control']:.2f}%")
st.write(f"**Treatment conversion:** {result['treatment']:.2f}%")
st.write(f"**Treatment effect:** {result['effect']}")
st.write(f"**95% confidence interval:** {result['ci']}")
st.write(f"**p-value:** {result['p_value']}")
st.write(f"**Power for 2% lift:** {result['power']}")

st.divider()

st.subheader("Recommendation")
st.info(result["recommendation"])


# Special finding: EXP-001
if experiment == "EXP-001":

    st.subheader("Segment reversal")

    st.write("Ghana: **-11.83 pp**")
    st.write("Cameroon: **+4.04 pp**")

    st.warning(
        "The overall average hides harm to Ghana users."
    )


# Special finding: EXP-007
if experiment == "EXP-007":

    st.subheader("Effect over time")

    st.write("Effect ranged from approximately **-3.73 pp to +1.04 pp**.")

    st.warning(
        "The effect was not stable throughout the experiment."
    )