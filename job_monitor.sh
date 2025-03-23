# get sif filename from command line
SIF=${1:-c3b-template.sif}

# Submit the job and capture the sbatch output.
job_output=$(sbatch job_myapp.sh $SIF)
echo "sbatch output: $job_output"

# Extract the job ID (assumes output: "Submitted batch job <jobid>")
jobid=$(echo "$job_output" | awk '{print $4}')
echo "Submitted job with ID: $jobid"

# Define terminal states to wait for.
terminal_states=("COMPLETED" "FAILED" "CANCELLED" "TIMEOUT")
job_state=""

# Poll the job state using sacct until it reaches a terminal state.
while true; do
    job_state=$(sacct -j "$jobid" --format=State --noheader | head -n 1 | tr -d ' ')
    echo "Job $jobid state: $job_state"
    
    # Check if the job state is one of the terminal states.
    if [[ " ${terminal_states[@]} " =~ " ${job_state} " ]]; then
        break
    fi
    
    echo "Job $jobid is still running... waiting 30 seconds."
    sleep 30
done

echo "Job $jobid has finished with state: $job_state"

echo "Detailed job information:"
# Show additional job information.
sacct -j "$jobid" --format=JobID,JobName,Partition,Account,AllocCPUS,State,ExitCode,Elapsed,Start,End --noheader

echo "Displaying job output log:"
cat apptainer.out