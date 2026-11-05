export const emailRegex = /^\w+[\w-.]*@\w+((-\w+)|(\w*))\.[a-z]{2,3}$/

export const usernameRegex = /^[a-zA-Z0-9\-._@+]+$/
export const usernameRequirements = "Usernames can only cantain letters, numbers, and the symbols: - . _ @ +"

export const passwordRegex =
    /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{":;'?/>.<,])(?!.*\s).{6,128}$/

export const passwordRequirements =
    'Password must be 6-128 characters and include at least one uppercase letter, one lowercase letter, one number, and one special character. Spaces are not allowed.'

export const emailValidation = {
    required: 'Email is required',
    maxLength: { value: 254, message: 'Email cannot exceed 254 characters' },
    pattern: {
        value: emailRegex,
        message: 'Not a valid email address'
    }
}

export const usernameValidation = {
    required: 'Username is required',
    maxLength: { value: 50, message: 'Username cannot exceed 50 characters' },
    pattern: {
        value: usernameRegex,
        message: usernameRequirements
    }
}
export const passwordValidation = {
    required: 'Password is required',
    maxLength: {
        value: 128,
        message: 'Password cannot exceed 128 characters'
    },
    pattern: {
        value: passwordRegex,
        message: passwordRequirements
    }
}

export const passwordConfirmValidation = {
    required: 'Confirm password is required',
    maxLength: {
        value: 128,
        message: 'Password cannot exceed 128 characters'
    }
}