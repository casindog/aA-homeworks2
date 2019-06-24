
const selectLocation = (city, jobs) => {
    return {
        type: "SWITCH_LOCATIN",
        city: city,
        jobs: jobs
    }
}

export default selectLocation;