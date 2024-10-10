'use client'

import React from 'react'
import BasicTable from '@/components/table'
import { Transaction } from '@/models/transaction'
import FormPage from '@/pages/FormPage'
import { Box, Grid2, Paper } from '@mui/material'
import axios from 'axios'

export default function Home() {
	const [data, setData] = React.useState<Transaction[]>([])

  React.useEffect(() => {
    // use axios to call api upload file

  }, [])

	return (
		<Box
			display='flex'
			justifyContent='center'
			alignItems='center'
			height='100vh'
		>
			<Paper
				sx={{
					padding: 5
				}}
			>
				<Grid2
					container
					direction={'column'}
					gap={2}
				>
					<Grid2>
						<FormPage setData={setData}/>
					</Grid2>
					<Grid2>
						<BasicTable data={data} />
					</Grid2>
				</Grid2>
			</Paper>
		</Box>
	)
}
