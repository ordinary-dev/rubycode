# @param {String} address
# @return {String}
def defang_i_paddr(address)
    new_addr = address.gsub(".", "[.]")
    return new_addr
end
