import { Button, Grid, IconButton, useMediaQuery, useTheme } from "@mui/material";
import AppTextInput from "../../../app/components/AppTextInput";
import { UseControllerProps, useFieldArray } from "react-hook-form";
import { Close } from "@mui/icons-material";
import { PHONE_NUMBER_TYPE } from "../../../app/util/constants";
import AppSelectList from "../../../app/components/AppSelectList";

interface Props extends UseControllerProps { }

/**
 * Component for Phone/Email inputs
 */
export default function PhoneEmail({ control }: Props) {
    const { fields, append, remove } = useFieldArray({
        control,
        name: "phoneNumbers"
    })
    
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    return (
        <Grid container item columnSpacing={2} justifyContent="center">
            <Grid item xs={6} sm={5} md={4}>
                {fields.map((field, index) => (
                    <Grid container spacing={0.5} sx={{ pb: 1 }} alignItems="center" key={field.id}>
                        <Grid item xs={4}>
                            <AppSelectList
                                control={control}
                                name={`phoneNumbers.${index}.type`}
                                items={PHONE_NUMBER_TYPE} label={"Type"}
                            />
                        </Grid>

                        <Grid item xs display="flex" alignItems="center">
                            <AppTextInput control={control} label={index === 0 ? "Primary Phone" : "Phone Number"}
                                name={`phoneNumbers.${index}.number`} format="phone"
                            />
                        </Grid>

                        <Grid item>
                            <IconButton onClick={() => remove(index)} color="error" size="small" sx={{ p: 0 }}>
                                <Close fontSize="small" />
                            </IconButton>
                        </Grid>
                    </Grid>
                ))}

                <Grid item display="flex" justifyContent="center">
                    {fields.length < 4 && (
                        <Button size={isMobile ? "small" : "medium"}
                        onClick={() => append({ type: PHONE_NUMBER_TYPE[0], number: "" })}
                        >
                            Add Phone Number
                        </Button>
                    )}
                </Grid>
            </Grid>

            <Grid item xs={6} sm={5} md={4}>
                <AppTextInput control={control} name="email" label="Email" />
            </Grid>
        </Grid>
    )
}