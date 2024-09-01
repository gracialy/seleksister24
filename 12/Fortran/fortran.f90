program Fortran
    implicit none
    integer :: n, i, j
    real(8), allocatable :: matrix(:,:), augmented_matrix(:,:), inverse_matrix(:,:)    
    character(len=100) :: input_file
    character(len=100) :: output_file
    real(8) :: pivot, factor  ! Declare 'pivot' and 'factor' here

    input_file = "input.txt"
    output_file = "output/fortran.txt"

    ! Read matrix from file
    open(unit=10, file=trim(input_file), status='old', action='read')
    read(10, *) n
    allocate(matrix(n, n))
    do i = 1, n
        read(10, *) (matrix(i, j), j = 1, n)
    end do
    close(10)  

    ! Print matrix
    open(unit=20, file=trim(output_file), status='unknown', action='write')
    ! Initialize augmented matrix
    allocate(augmented_matrix(n, 2*n))
    do i = 1, n
        do j = 1, n
            augmented_matrix(i, j) = matrix(i, j)
            augmented_matrix(i, j+n) = 0.0
        end do
        augmented_matrix(i, i+n) = 1.0
    end do

    ! Perform Gauss-Jordan elimination
    do i = 1, n
        ! Pivot
        pivot = augmented_matrix(i, i)
        augmented_matrix(i, :) = augmented_matrix(i, :) / pivot
        ! Eliminate
        do j = 1, n
            if (i /= j) then
                factor = augmented_matrix(j, i)
                augmented_matrix(j, :) = augmented_matrix(j, :) - factor * augmented_matrix(i, :)
            end if
        end do
    end do

    ! Extract the inverse matrix from augmented_matrix
    allocate(inverse_matrix(n, n))
    do i = 1, n
        do j = 1, n
            inverse_matrix(i, j) = augmented_matrix(i, j+n)
        end do
    end do

    ! Print inverse matrix
    write(10, '(I0)') n
    open(unit=30, file=trim(output_file), status='unknown', action='write', position='append')
    do i = 1, n
        write(30, '(100F8.2)') (inverse_matrix(i, j), j = 1, n)
    end do
    close(30)

end program Fortran
