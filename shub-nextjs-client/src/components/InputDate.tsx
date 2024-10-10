import React from 'react'
import { DemoContainer, DemoItem } from '@mui/x-date-pickers/internals/demo'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { DateTimeRangePicker } from '@mui/x-date-pickers-pro/DateTimeRangePicker'
import dayjs from 'dayjs'
import moment from 'moment'
import { DateRangePicker } from '@mui/x-date-pickers-pro/DateRangePicker';

const today = dayjs()
const yesterday = dayjs().subtract(1, 'day')
export const InputDate = ({
	label,
	setDataFilter
}: {
	label: string
	setDataFilter: (value: { fromDate: string; toDate: string }) => void
}) => {
	return (
		<LocalizationProvider dateAdapter={AdapterDayjs}>
			<DemoContainer components={['DateTimeRangePicker']}>
				<DemoItem component='DateTimeRangePicker'>
					<DateRangePicker
						defaultValue={[yesterday, today]}
						onChange={(e) => {
							const [start, end] = e
              setDataFilter({
                fromDate: moment(start?.toISOString()).format( "DD/MM/YYYY"),
                toDate: moment(end?.toISOString()).format( "DD/MM/YYYY")
              })
						}}
            format='DD/MM/YYYY'
					/>
				</DemoItem>
			</DemoContainer>
		</LocalizationProvider>
	)
}
