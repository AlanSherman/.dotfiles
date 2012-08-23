function fsh () {
    ssh -t fir "sudo bash -i -c \"ssh $@\""
}
