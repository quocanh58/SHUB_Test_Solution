'use client'

import * as React from 'react'
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell from '@mui/material/TableCell'
import TableContainer from '@mui/material/TableContainer'
import TableHead from '@mui/material/TableHead'
import TableRow from '@mui/material/TableRow' // Import the missing module
import Paper from '@mui/material/Paper'
import { Transaction } from '@/models/transaction'
import { Box, TablePagination } from '@mui/material'

export class Header {
	key: keyof Transaction
	label: string

	constructor(key: keyof Transaction, label: string) {
		this.key = key
		this.label = label
	}
}

const headers: Header[] = [
	new Header('id', 'STT'),
	new Header('date', 'Ngày'),
	new Header('time', 'Giờ'),
	new Header('station', 'Trạm'),
	new Header('pumpPole', 'Trụ bơm'),
	new Header('item', 'Mặt hàng'),
	new Header('quantity', 'Số lượng'),
	new Header('unitPrice', 'Đơn giá'),
	new Header('totalAmount', 'Thành tiền (VNĐ)'),
	new Header('paymentStatus', 'Trạng thái thanh toán'),
	new Header('customerID', 'Mã khách hàng'),
	new Header('customerName', 'Tên khách hàng'),
	new Header('customerType', 'Loại khách hàng'),
	new Header('paymentDate', 'Ngày thanh toán'),
	new Header('employee', 'Nhân viên'),
	new Header('vehicleNumber', 'Biển số xe'),
	new Header('invoiceStatus', 'Trạng thái hoá đơn')
] as Header[]

export default function BasicTable({ data }: { data: Transaction[] }) {
	const [page, setPage] = React.useState(0)
	const [dense, setDense] = React.useState(false)
	const [rowsPerPage, setRowsPerPage] = React.useState(5)

	const handleChangePage = (event: unknown, newPage: number) => {
		setPage(newPage)
	}

  React.useEffect(() => {
    setPage(0)
  }, [data])

	const handleChangeRowsPerPage = (event: React.ChangeEvent<HTMLInputElement>) => {
		setRowsPerPage(parseInt(event.target.value, 10))
		setPage(0)
	}

	const handleChangeDense = (event: React.ChangeEvent<HTMLInputElement>) => {
		setDense(event.target.checked)
	}

	// Avoid a layout jump when reaching the last page with empty rows.


	return (
		<Box>
			<TableContainer component={Paper} sx={{
        width:"90vw"
      }}>
				<Table
					sx={{ minWidth: 650 }}
					aria-label='simple table'
				>
					<TableHead>
						<TableRow>
							{headers.map((header) => (
								<TableCell
									sx={{
										textWrap: 'nowrap'
									}}
								>
									{header.label}
								</TableCell>
							))}
						</TableRow>
					</TableHead>
					<TableBody>
						{[...data].slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)?.map((row) => (
							<TableRow
								key={row.id}
								sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
							>
								{headers.map((header) => (
									<TableCell
										align='right'
										sx={{
											textWrap: 'nowrap'
										}}
									>
										{'' + row[header.key]}
									</TableCell>
								))}
							</TableRow>
						))}
					</TableBody>
				</Table>
			</TableContainer>
			<TablePagination
				rowsPerPageOptions={[5, 10, 25]}
				component='div'
				count={data.length}
				rowsPerPage={rowsPerPage}
				page={page}
				onPageChange={handleChangePage}
				onRowsPerPageChange={handleChangeRowsPerPage}
			/>
		</Box>
	)
}
