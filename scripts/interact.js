async function main() {
  const contractAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
  const Contract = await ethers.getContractFactory('HelloWorld');
  const contract = await Contract.attach(contractAddress);

  // Reading the current message
  const message = await contract.getMessage();
  console.log('Current Message:', message);

  // Updating the message
  const tx = await contract.setMessage('New Hello World Message');
  await tx.wait();

  // Confirming the change
  const updatedMessage = await contract.getMessage();
  console.log('Updated Message:', updatedMessage);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
